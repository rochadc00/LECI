/*
 *  @brief A simple FIFO, whose elements are pairs of integers,
 *      one being the id of the producer and the other the value produced
 *
 * @remarks Unsafe, blocking, busy waiting version
 *
 *  The following operations are defined:
 *     \li insertion of a value
 *     \li retrieval of a value.
 *
 * \author (2016) Artur Pereira <artur at ua.pt>
 */

#include <stdio.h>
#include <unistd.h>
#include <stdbool.h>
#include <errno.h>
#include <pthread.h>

#include "thread.h"
#include "fifo.h"
#include "delays.h"

/** \brief internal storage size of <em>FIFO memory</em> */
#define  FIFOSZ         5

/*
 *  \brief Data structure.
 */
typedef struct ITEM
{
    unsigned int id;     ///< id of the producer
    unsigned int value;  ///< value stored
} ITEM;

typedef struct FIFO
{ 
    unsigned int ii;   ///< point of insertion
    unsigned int ri;   ///< point of retrieval
    unsigned int cnt;  ///< number of items stored
    ITEM slot[FIFOSZ];  ///< storage memory
} FIFO;

/** \brief internal storage region of FIFO type */
static FIFO fifo;

/* changes here: */
    static pthread_cond_t fifoNotFull = PTHREAD_COND_INITIALIZER;
    static pthread_cond_t fifoNotEmpty = PTHREAD_COND_INITIALIZER;

/** \brief locking flag which warrants mutual exclusion inside the monitor */
static pthread_mutex_t accessCR = PTHREAD_MUTEX_INITIALIZER;


/* ************************************************* */

/* Initialization of the FIFO */
void fifoInit(void)
{
    unsigned int i;
    for (i = 0; i < FIFOSZ; i++)
    {
        fifo.slot[i].id = 99999999;
        fifo.slot[i].value = 99999999;
    }
    fifo.ii = fifo.ri = 0;
    fifo.cnt = 0;

    /* changes here:
    cond_broadcast(&fifoNotFull);

    mutex_unlock(&accessCR);
    */

}

/* ************************************************* */

/* Check if FIFO is full */
static bool fifoFull(void)
{
    return fifo.cnt == FIFOSZ;
}

/* ************************************************* */

/* Check if FIFO is empty */
static bool fifoEmpty(void)
{
    return fifo.cnt == 0;
}

/* ************************************************* */

/* Insertion of a pait <id, value> into the FIFO  */
void fifoIn(unsigned int id, unsigned int value)
{

     mutex_lock(&accessCR); // prende os próximos valores para que apenas quando ii incremente e fizemos unlock é que possam entrar na FIFO
    /* wait while fifo is full */
    while (fifoFull())
    {
        cond_wait(&fifoNotFull,&accessCR);
        //usleep(1000);
    }

    /* Insert pair */
    fifo.slot[fifo.ii].value = value; // guarda um valor
    gaussianDelay(1, 0.5); // espera algum tempo
    fifo.slot[fifo.ii].id = id; // e coloca o id
    fifo.ii = (fifo.ii + 1) % FIFOSZ;
    fifo.cnt++;

    cond_broadcast(&fifoNotEmpty);
    mutex_unlock(&accessCR);

    // enquanto um não acabar a sua atualização na FIFO, o proximo valor não pode ser colocado
    // pois o ii pode não ter incrementado/lido o proximo valor e podemos associar um id diferente do seu value
}

/* ************************************************* */

/* Retrieval of a pair <id, value> from the FIFO */

void fifoOut (unsigned int * idp, unsigned int * valuep)
{

    mutex_lock(&accessCR); // faz bloqueio para que outro valor na FIFO nao seja lido ate o atual nao terminar

    /* wait while fifo is empty */
    while(fifoEmpty())
    {
        usleep(1000);
    }

    /* Retrieve pair */
    *valuep = fifo.slot[fifo.ri].value;
    fifo.slot[fifo.ri].value = 99999999;
    *idp = fifo.slot[fifo.ri].id;
    fifo.slot[fifo.ri].id = 99999999;
    fifo.ri = (fifo.ri + 1) % FIFOSZ;
    fifo.cnt--;

    cond_broadcast(&fifoNotFull);

    mutex_unlock(&accessCR);

}

/* ************************************************* */

