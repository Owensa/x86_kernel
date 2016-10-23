ENTRY(start) 

SECTIONS { 
	. = 1M; 
	
	.boot :
	{ 
		*(.multiboot_h)
	}

	.text :
	{ 
		*(.text)
	} 
}
