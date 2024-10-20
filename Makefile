# 変数の設定
NAME = libft.a
CC = cc
CFLAGS = -Wall -Wextra -Werror
SRC_DIR = src
OBJ_DIR = obj
TEST_DIR = tests
INCLUDE_DIR = include
SRCS = $(shell find $(SRC_DIR) -name "*.c")
OBJS = $(SRCS:$(SRC_DIR)/%.c=$(OBJ_DIR)/%.o)
TEST_SRCS = $(shell find $(TEST_DIR) -name "*.c")

# ターゲットの定義
all: $(NAME)

$(NAME): $(OBJS)
	ar rcs $(NAME) $(OBJS)

$(OBJ_DIR)/%.o: $(SRC_DIR)/%.c | $(OBJ_DIR)
	$(CC) $(CFLAGS) -I $(INCLUDE_DIR) -c $< -o $@

$(OBJ_DIR):
	mkdir -p $(OBJ_DIR)

# テストのコンパイルと実行
test: $(NAME)
	$(CC) $(CFLAGS) -I $(INCLUDE_DIR) $(TEST_SRCS) -L. -lft -o test.out
	./test.out

clean:
	rm -rf $(OBJ_DIR) test.out

fclean: clean
	rm -f $(NAME)

re: fclean all
