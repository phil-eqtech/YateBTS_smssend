#
# Makefile for smssend
# 
# SmsSend is a plugin for Yate, allowing to send a sms to a phone number
# 

NAME1	= smssend.yate
NAME2	= smsbsend.yate
INSTALL1 = /usr/local/lib/yate/$(NAME1)
INSTALL2 = /usr/local/lib/yate/$(NAME2)

CC		= g++
RM		= rm -f
LN		= ln -s
CP		= cp

SRCS1	= smssend.cpp
OBJS1	= $(SRCS2:.cpp=.o)
SRCS2	= smsbsend.cpp
OBJS2	= $(SRCS1:.cpp=.o)
CFLAGS	= -std=c++11 -fPIC 
LFLAGS	= -shared
LIBS 	=
INCLUDES= -I /usr/local/include/yate/

ifdef DEBUG
	CFLAGS += -g3
endif

.cpp.o:
	$(CC) $(CFLAGS) $(INCLUDES) -c $<  -o $@

all: $(NAME1) $(NAME2)

$(NAME1): $(OBJS1)
	$(CC) -o $(NAME1) $(OBJS1) $(LFLAGS) $(LIBS)

$(NAME2): $(OBJS2)
	$(CC) -o $(NAME2) $(OBJS2) $(LFLAGS) $(LIBS)

clean:
	$(RM) $(OBJS1)
	$(RM) $(OBJS2)

fclean: clean
	$(RM) $(NAME1)
	$(RM) $(NAME2)

re: fclean all

install:
	$(CP) $(NAME1) $(INSTALL1)
	$(CP) $(NAME2) $(INSTALL2)

uninstall: fclean
	$(RM) $(INSTALL1)
	$(RM) $(INSTALL2)

.PHONY: all clean fclean .cpp.o re install
