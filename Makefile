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
			strncmp.asm	\
			strcspn.asm	\
			strstr.asm	\
			strpbrk.asm	\
			memcpy.asm	\
			memmove.asm	\


SRC_C	=	main.c

OBJ     =	$(SRC:.asm=.o)

OBJ_C     =	$(SRC_C:.c=.o)

NAME    =	libasm.so

CFLAGS	=	-fpic -shared

FLAGS	=	-f elf64

NASM	=	nasm

%.o : %.asm
	$(NASM) $(FLAGS) -o $@ $<

all: 	$(OBJ)
	$(CC) $(CFLAGS) -o $(NAME) $(OBJ)

clean:
	$(RM) $(OBJ)

fclean: clean
	$(RM) $(NAME)

re:	fclean all

.PHONY:	all clean fclean re
