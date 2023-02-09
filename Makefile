##
## EPITECH PROJECT, 2022
## Makefile
## File description:
## makefile
##

SRC     =	strlen.asm	\
			strchr.asm	\
			strrchr.asm	\
			memset.asm	\
			strcmp.asm	\
			strcasecmp.asm	\
			strstr.asm	\
			memcpy.asm	\
			memmove.asm	\
			strpbrk.asm	\
			strcspn.asm	\
			strncmp.asm	\

OBJ     =	$(SRC:.asm=.o)

NAME    =	libasm.so

CFLAGS	=	-shared

FLAGS	=	-f elf64

NASM	=	nasm

LDFLAGS	=	--coverage -lcriterion

%.o : %.asm
	$(NASM) $(FLAGS) -o $@ $<

all: 	$(OBJ)
	ld $(CFLAGS) -o $(NAME) $(OBJ)

clean:
	$(RM) $(OBJ)

fclean: clean
	$(RM) $(NAME)

re:	fclean all

.PHONY:	all clean fclean re
