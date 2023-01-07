
void print(char* str) {
  static unsigned short* VideoMemory = (unsigned short*)0xb8000;

  for(int i=0; str[i] != '\0'; ++i){
    VideoMemory[i] = (VideoMemory[i] & 0xFF00) | str[i];
  }
}

extern "C" void kernelStart(const void* multiboot_structure, unsigned int /*magicnumber*/) {
  print("Bem-Vindo ao BarcaOS");

  while(1);
}