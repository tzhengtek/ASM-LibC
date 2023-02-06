##
## EPITECH PROJECT, 2022
## Makefile
## File description:
## makefile
##

SRC     =	strlen.asm	\
			strchr.asm

OBJ     =	$(SRC:.asm=.o)

NAME    =	libasm.so

CFLAGS	=	-Wall -Wextra

all: 	$(NAME)

$(NAME):
	nasm -f elf64 $(SRC)

clean:
	$(RM) $(OBJ)

fclean: clean
	$(RM) $(NAME)

re:	fclean all

.PHONY:	all clean fclean re
