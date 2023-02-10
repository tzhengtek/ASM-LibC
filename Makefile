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
			memcpy.asm	\
			strcasecmp.asm	\
			strpbrk.asm	\
			strcspn.asm	\
			strncmp.asm	\
			strstr.asm	\
			memmove.asm	\

SRC_C	=	tests/tests_asm.c

OBJ     =	$(SRC:.asm=.o)

NAME    =	libasm.so

CFLAGS	=	 -shared

TEST_NAME	=	unit_tests

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

tests_run: re
	$(CC) -o $(TEST_NAME) $(SRC_C) $(LDFLAGS)
	./$(TEST_NAME)
	LD_PRELOAD=./$(NAME) ./$(TEST_NAME)

re:	fclean all

.PHONY:	all clean fclean re
