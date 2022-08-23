#include  "fifo.h"
#include  "thread.h"

#include <unistd.h>
#include <sys/types.h>
#include <sys/wait.h>
#include <pthread.h>
#include <cctype>
#include <string>


#define FIFOsize 25

typedef struct FIFO
{ 
    uint32_t ii;   ///< point of insertion
    uint32_t ri;   ///< point of retrieval
    uint32_t cnt;  ///< number of items stored
    uint32_t ids[FIFOsize];  ///< storage memory
    /** \brief condition variable for checking fifo fullness and emptiness */
    pthread_cond_t notEmpty = PTHREAD_COND_INITIALIZER;
    pthread_cond_t notFull = PTHREAD_COND_INITIALIZER;
    /** \brief locking flag which warrants mutual exclusion inside the monitor */
    pthread_mutex_t accessCR = PTHREAD_MUTEX_INITIALIZER;
} FIFO;

typedef struct ServiceRequest
{
    unsigned int clientID;
    char *line;
}ServiceRequest;

typedef struct ServiceResponse
{
    unsigned int serverID = 0;
    unsigned int nBuffer = 0;
    unsigned int alpha = 0;
    unsigned int numbers = 0;
}ServiceResponse;

typedef struct SLOT
{
    ServiceResponse res;
    ServiceRequest req;
    bool hasResponse = false;
    pthread_mutex_t sync = PTHREAD_MUTEX_INITIALIZER;
    pthread_cond_t available = PTHREAD_COND_INITIALIZER;
}SLOT;

/* Argument value for producer and consumer threads */
typedef struct ARGV
{
    unsigned int id;      ///< thread id
    unsigned int niter;   ///< number of iterations
} ARGV;


static SLOT pool[FIFOsize];
static FIFO freeBuffers;
static FIFO pendingRequest;

// fifo of ids of buffers available
void freeINIT(void)
{
    mutex_lock(&freeBuffers.accessCR);
    freeBuffers.ii = freeBuffers.ri = 0;
    freeBuffers.cnt = FIFOsize;
    uint32_t i;
    for ( i = 0; i < FIFOsize; i++) {
        freeBuffers.ids[i] = i;
    }
    cond_signal(&freeBuffers.notEmpty);
    mutex_unlock(&freeBuffers.accessCR);
}

// fifo of ids of buffers w/ pending requests
void requestsInit()
{
    pendingRequest.cnt = pendingRequest.ii = pendingRequest.ri = 0;
    mutex_unlock(&pendingRequest.accessCR);
}

// inserir um valor dentro da FIFO correspondente a um user
void insert(FIFO *fifo, uint32_t id) 
{
    mutex_lock(&fifo->accessCR); // aceder acesso à fifo apenas a este usar, bloquear os que tentam aceder à frente

    fifo -> ids[fifo->ii] = id; // insere id correspondente ao user na fifo
    fifo -> ii = (fifo->ii + 1) % FIFOsize; // incrementa o tamanho ocupado da fifo
    fifo -> cnt++;

    cond_signal(&fifo -> notEmpty); // condição final: ao inserir, a fifo não pode mais estar vazia (caso esteja anteriormente)
    mutex_unlock(&fifo -> accessCR); // condição final : permitir o acesso de outro user à fifo depois deste último sair

}

uint32_t retrieve(FIFO *fifo) 
{
    mutex_lock(&fifo -> accessCR);

    while (fifo -> cnt == 0) {
        cond_wait(&fifo -> notEmpty, &fifo -> accessCR); // esperar até fifo não estiver vazia &/ou tiver acesso
    }

    uint32_t id = fifo -> ids[fifo->ri];
    fifo-> ids[fifo->ri] = 99999999;
    fifo-> ri = (fifo->ri+1) % FIFOsize;
    fifo -> cnt--;

    mutex_unlock(&fifo -> accessCR);
    return id;
}

void signalResponseIsAvailable(uint32_t id) 
{
    pool[id].hasResponse = true;
    cond_signal(&pool[id].available);
}

void waitForResponde(uint32_t id) 
{
    while(!pool[id].hasResponse) {
        cond_wait(&pool[id].available, &pool[id].sync);
    }
    pool[id].hasResponse = false;
}

void callService(ServiceRequest & req, ServiceResponse & res) 
{
    unsigned int id = retrieve(&freeBuffers);

    mutex_lock(&pool[id].sync);
    pool[id].req = req;
    insert(&pendingRequest, id);
    waitForResponde(id);
    res = pool[id].res;
    insert(&freeBuffers, id);

    mutex_unlock(&pool[id].sync);
}

// void processService(int serverID) {
//     unsigned int id = retrieve(&pendingRequest);

//     mutex_lock(&pool[id].sync);
//     ServiceResponse resp;
//     resp.serverID = serverID;

//     for( char *p = pool[id].req.line; *p != '\0'; p++) {
//         resp.nBuffer++;


//     }

// }

void *client(void *arg) 
{
    int id = *((int *)arg); // obtem o id pelo argumento e inverte para int
    int niter = 25;
    for (int i = 0; i < niter; i++) {
        ServiceRequest req;
        req.clientID = id;
        // printf("%d\n", req.client);
        ServiceResponse res;
        callService(req,res);
        printf("Client %u call service -> %d\n", req.clientID, i+1); 
        printf("Size: %u    Alpha: %u   Numbers: %u     Server: %u\n", res.nBuffer, res.alpha, res.numbers, res.serverID);
    } return NULL;
}

void *server(void *arg) 
{
    int id = *((int *)arg);
    // while (1) {
    //     proccessService(id);
    // }
    return NULL;
}

int main(void) 
{
    return 0;
}