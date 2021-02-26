#include "../u8g2Headers/spi_master.h"
#include "../u8g2Headers/u8g2TestHarness_main.h"
 //tweaked for PIC32MX170F256B, uses SPI1

// Hardware
#include <xc.h>
#include <proc/p32mx170f256b.h>
#include <sys/attribs.h> // for ISR macors
         
/****************************************************************************
 Function
    SPI_Init
 Parameters
    void
 Returns
    void
 Description
    set up the SPI system for use. Set the clock phase and polarity, master mode
    clock source, baud rate, SS control, transfer width (8-bits)
 Notes
    don't forget to map the pins & set up the TRIS not only for the SPI pins
    but also for the DC (RB13) & Reset (RB12) pins 
 
****************************************************************************/
void SPI_Init(void){

    // disable analog function on all SPI pins
    ANSELA = 0;
    ANSELB = 0;

    // map pins (SCK1 to RB14 automatically)
    RPA1R = 0b0011;    // RA1 to SDO1
    RPA0R = 0b0011;    // RA0 to SSbar
    
    // set RA0, RA1, RB12, RB13, RB14 to output pins
    TRISAbits.TRISA0 = 0;
    TRISAbits.TRISA1 = 0;
    DC_TRIS = 0;
    RST_TRIS = 0;
    TRISBbits.TRISB14 = 0;
    
    // set bit width to 8 bits
    SPI1CONbits.MODE32 = 0;
    SPI1CONbits.MODE16 = 0;

    // clear ON bit
    SPI1CONbits.ON = 0;

    // clear receive buffer by reading it
    uint32_t clear = SPI1BUF;
    // set ENHBUF off
    SPI1CONbits.ENHBUF = 0;
    // write Baud Rate register
    SPI1BRG = 0; // F_SCK shift clock 10MHz
    // clear SPIROV bit
    SPI1STATbits.SPIROV = 0;
    // master mode enable
    SPI1CONbits.MSTEN = 1;
    // clock edge select even
    SPI1CONbits.CKE = 0;
    // clock polarity select high
    SPI1CONbits.CKP = 1;
    // master mode slave select enabled
    SPI1CONbits.MSSEN = 1;
    // frame sync polarity
    SPI1CONbits.FRMPOL = 0;
    // master clock select to PB clock
    SPI1CONbits.MCLKSEL = 0;

    // set ON bit
    SPI1CONbits.ON = 1;

}

/****************************************************************************
 Function
    SPI_Tx
 Parameters
   uint8_t data   the 8-bit value to be sent out through the SPI
 Returns
    void
 Description
    write the data to the SPIxBUF and then wait for it to go out (SPITBF)
 Notes
    don't forget to read the buffer after the transfer to prevent over-runs
 
****************************************************************************/
void SPI_Tx(uint8_t data){
    while(SPI1STATbits.SPITBF == 1){}  // while transmit buffer is full, wait
    SPI1BUF = data;  // write to transmit buffer
    uint32_t clear = SPI1BUF;  // clear buffer by reading it
}

/****************************************************************************
 Function
    SPI_TxBuffer
 Parameters
   uint8_t *buffer, a pointer to the buffer to be transmitted 
   uint8_t length   the number of bytes in the buffer to transmit
 Returns
    void
 Description
   loop through buffer calling SPI_Tx for each element in the buffer
 Notes

 
****************************************************************************/
void SPI_TxBuffer(uint8_t *buffer, uint8_t length){    
    uint8_t i;  // iterator
    
    // iterate through buffer array and transmit to transmit buffer
    for(i=0; i<length; i++){
        SPI_Tx(*(buffer + i));
    }
}
