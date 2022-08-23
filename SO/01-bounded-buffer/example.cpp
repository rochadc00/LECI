#include<stdio.h>
#include<stdlib.h>
#include<pthread.h>
#include <stdint.h>
#include <unistd.h>
#include  <sys/types.h>
#include <cctype>

#include "thread.h"

#define FIFOSZ 10

typedef struct ServiceRequest
{   
    unsigned int client;
    char *frase;
}ServiceRequest;

typedef struct ServiceResponse
{
    unsigned int serverid;
    unsigned int nchars = 0;
    unsigned int alpha = 0;
    unsigned int numbers = 0;
}ServiceResponse;

typedef struct SLOT
{
    ServiceResponse res;
    ServiceRequest req;
    bool hasResponse = false;
    pthread_mutex_t sync = PTHREAD_MUTEX_INITIALIZER;
    pthread_cond_t respAvai = PTHREAD_COND_INITIALIZER;
}SLOT;

typedef struct FIFO
{
    unsigned int ii;   ///< point of insertion
    unsigned int ri;   ///< point of retrieval
    unsigned int cnt;  ///< number of items stored
    unsigned int ids[FIFOSZ];  ///< storage memory
    pthread_cond_t notEmpty = PTHREAD_COND_INITIALIZER;
    pthread_mutex_t accessCR = PTHREAD_MUTEX_INITIALIZER;
}FIFO;


static SLOT slots[FIFOSZ];
static FIFO frees;
static FIFO requests;

void freeInit(){
    mutex_lock(&frees.accessCR);
    frees.cnt = FIFOSZ;
    frees.ii = frees.ri = 0;
    int i;
    for(i = 0; i < FIFOSZ; i++){
        frees.ids[i] = i;
    }
    cond_signal(&frees.notEmpty);
    mutex_unlock(&frees.accessCR);
}

void requestsInit(){
    requests.cnt = requests.ii = requests.ri = 0;
    mutex_unlock(&requests.accessCR);
}

void insert(FIFO *fifo, u_int32_t id){
    mutex_lock(&fifo->accessCR);

    fifo->ids[fifo->ii] = id;
    fifo->ii = (fifo->ii + 1) % FIFOSZ;
    fifo->cnt++;

    cond_signal(&fifo->notEmpty);

    mutex_unlock(&fifo->accessCR);
}

u_int32_t retrieve(FIFO * fifo){
    mutex_lock(&fifo->accessCR);

    while(fifo->cnt == 0){
        cond_wait(&fifo->notEmpty, &fifo->accessCR);
    }

    u_int32_t id = fifo->ids[fifo->ri];
    fifo->ids[fifo->ri] = 99999999;
    fifo->ri = (fifo->ri + 1) % FIFOSZ;
    fifo->cnt--;

    mutex_unlock(&fifo->accessCR);
    return id;
}

void signalResponseIsAvailable(u_int32_t id){
    slots[id].hasResponse = true;
    cond_signal(&slots[id].respAvai);
}

void waitForResponse(u_int32_t id){
    while(!slots[id].hasResponse){
        cond_wait(&slots[id].respAvai,&slots[id].sync);
    }
    slots[id].hasResponse = false;
}

void callService(ServiceRequest & req, ServiceResponse &res){
    unsigned int id = retrieve(&frees);
    req.frase = "Teste string 1111";
    
    mutex_lock(&slots[id].sync);
    //printf("Calculou");
    slots[id].req = req;
    insert(&requests, id);
    waitForResponse(id);
    res = slots[id].res;
    insert(&frees, id);

    mutex_unlock(&slots[id].sync);
    
}

void processService(int serverid){
    unsigned int id = retrieve(&requests);
    
    mutex_lock(&slots[id].sync);
    //fazer reset
    ServiceResponse resp;
    resp.serverid = serverid;
    
    for (char *p = slots[id].req.frase; *p != '\0'; p++)
    {
        resp.nchars++;
        if(isdigit(*p)) resp.numbers++;
        if(isalpha(*p)) resp.alpha++;
    }
    slots[id].res = resp;
    signalResponseIsAvailable(id);
    mutex_unlock(&slots[id].sync);
}

typedef struct ARGV
{
    int id;
    int niter;
}ARGV;


void *client(void *arg){
	int id  =*((int *)arg);
	int iter = 10;	
	for(int i = 0; i < iter; i++){
		ServiceRequest req;
        	req.client = id;
        	//printf("%d\n",req.client);
       		ServiceResponse res;
        	callService(req, res);
       		printf("Client %u call service-> %d\n",req.client,i+1);fflush;
        	printf("Size: %u    Alpha: %u   Numbers: %u  Server: %u\n",res.nchars,res.alpha,res.numbers,res.serverid);fflush;
   	 }
    	return NULL;
}

void *server(void *arg){
    int id  =*((int *)arg);

    while(1){
        processService(id);
    }
}


int main(void){
    freeInit();
    requestsInit();

    //srand(getpid());
    int nservers = 2;
    int nclients = 2;

    pthread_t servers[nservers];
    pthread_t clients[nclients];
    int iter = 10;
    ARGV carg[nclients];
    ARGV sarg[nservers];
    
    int i;
    for(i = 0; i < nservers; i++){
        sarg[i].id = i;
        thread_create(&servers[i], NULL,server,(void *)&i);
        printf("Server %d create\n", i); fflush;
    }

    for (i = 0; i < nclients; i++)
    {
        carg[i].id = i;
        carg[i].niter = iter;
        thread_create(&clients[i], NULL,client,(void *)&i);
        printf("Client %d create\n", i);fflush;
    }

    for (i = 0; i < nclients; i++){
        thread_join(clients[i], NULL);
        printf("Client %u terminated\n",i);fflush;
    }

    for (i = 0; i < nservers; i++){
        thread_cancel(servers[i]);
        printf("Server %u terminated\n",i);fflush;
    }

    return 0;
}