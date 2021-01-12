#pragma bank 3

#include <gb/gb.h>

#include "sample_player.h"
#include "sampledata2.h"

void play_sample2() __banked {
  set_sample(_current_bank, sample2, sizeof(sample2)); 
}