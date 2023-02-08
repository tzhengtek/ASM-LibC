##
## EPITECH PROJECT, 2022
## Makefile
## File description:
## makefile
##

SRC     =	strlen.asm	\
			strcmp.asm	\
			strncmp.asm	\
			strchr.asm	\
			strrchr.asm	\
			strcasecmp.asm	\
			strpbrk.asm	\
			strstr.asm	\
			memset.asm	\
			memmove.asm	\
			strcspn.asm	\
			memcpy.asm	\


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
