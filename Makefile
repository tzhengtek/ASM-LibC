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


SRC_C	=	main.c

OBJ     =	$(SRC:.asm=.o)

EXEC	=	a.out

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
	$(RM) $(EXEC)

fclean: clean
	$(RM) $(NAME)

re:	fclean all

.PHONY:	all clean fclean re
