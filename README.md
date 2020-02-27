# Roger_Skyline

## Virtual Machine setup

### Disk and partitions sizes

To set the perfect size of Disk and partition, we have to think about the general misuse of term "Gigabyte". A lot of people think that a Kilobyte, Megabyte, Gigabyte are multiples of 2^10 (1024) but according to recent norm a Kilobyte is exactly 1000 bytes and the precedent usage is renamed in KIBIbyte with 2^10 (Kilo Binariy Bytes).
In virtual box the unit used is the Kibibyte, to create a 8 Gigabyte disk we have to set the size of the disk to 8000000000 without unit.
To set exactly the right size of 4.2Gb when partitionning disk, the size must be set using the number of sectors. As a sector is 512 bytes, 4.2Gb is equal to 8203125 sectors (4200000000 / 512).


## SSH
### Change port
