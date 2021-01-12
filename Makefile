CC = ../../gbdk/bin/lcc
#DEBUG = 1
CFLAGS = -Wl-yt1 -Wl-yo4
OBJDIR = obj

ifdef DEBUG
CFLAGS += -Wf--debug -Wf--nolospre -Wl-j -Wl-m -Wl-w -Wl-y
endif

SRCS = $(foreach dir,src,$(notdir $(wildcard $(dir)/*.c))) 
OBJS = $(SRCS:%.c=$(OBJDIR)/%.o) 

all:	clean rom

.SECONDARY: $(OBJS) 

$(OBJDIR)/%.o:	src/%.c
	$(CC) $(CFLAGS) -c -o $@ $<

%.gb:	$(OBJS)
	$(CC) $(CFLAGS) -o $@ $^

wav:
	python utils/cvtsample.py sndrec/icq-message.wav sample1 C >src/sampledata1.h
	python utils/cvtsample.py sndrec/KICK.wav sample2 C >src/sampledata2.h

prepare:
	mkdir $(OBJDIR)

clean:
	rm -rf $(OBJDIR)/*
	rm -rf samptest.*

rom: prepare wav samptest.gb
	@echo "done"