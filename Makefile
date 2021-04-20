#Makefile for scop

NAME = scop

SRC_PATH = ./srcs/

OBJ_PATH = ./objs/

CPPFLAGS = -I./includes/

SRC_NAME =	parser.c					\

OBJ_NAME = $(SRC_NAME:.c=.o)

SRC = $(addprefix $(SRC_PATH)/,$(SRC_NAME))

OBJ = $(addprefix $(OBJ_PATH), $(OBJ_NAME))

LDFLAGS = -L./libft/

LFT = -lft

CC = gcc $(CFLAGS)

CFLAGS = -Wall -Wextra -Werror
#-ggdb -fsanitize=address -fno-omit-frame-pointer

SCOP_FLAGS = -lGL -lglut -lGLEW

all: $(NAME)

$(NAME): $(OBJ)
		@make -C./libft/
		@echo "\033[34mCreation of $(NAME) ...\033[0m"
		@$(CC) $(LDFLAGS) $(LFT) $(OBJ) -o $@ $(SCOP_FLAGS)
		@echo "\033[32m$(NAME) created\n\033[0m"

$(OBJ_PATH)%.o: $(SRC_PATH)%.c
		@mkdir $(OBJ_PATH) 2> /dev/null || true
		@$(CC) $(CPPFLAGS) -o $@ -c $<

clean:
		@make clean -C ./libft/
		@echo "\033[33mRemoval of .o files of $(NAME) ...\033[0m"
		@rm -f $(OBJ)
		@rmdir $(OBJ_PATH) 2> /dev/null || true
		@echo "\033[31mFiles .o deleted\n\033[0m"

fclean: clean
		@make fclean -C ./libft/
		@echo "\033[33mRemoval of $(NAME)...\033[0m"
		@rm -f $(NAME)
		@echo "\033[31mBinary $(NAME) deleted\n\033[0m"

re: fclean all

norme:
		norminette $(SRC)
		norminette $(INC_PATH)*.h

.PHONY: all, clean, fclean, re


