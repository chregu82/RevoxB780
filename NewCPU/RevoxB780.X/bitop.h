/* 
 * File:   bitop.h
 * Author: lehne
 *
 * Created on 2. März 2024, 14:41
 */

#ifndef BITOP_H
#define	BITOP_H

#ifdef	__cplusplus
extern "C" {
#endif

#define bitset(byte,bit)   ((byte) |=  (1<<(bit)))
#define bitclr(byte,bit) ((byte) &= ~(1<<(bit)))
#define bitflp(byte,bit)  ((byte) ^=  (1<<(bit)))
#define bitchk(byte,bit) ((byte) &   (1<<(bit)))


#ifdef	__cplusplus
}
#endif

#endif	/* BITOP_H */

