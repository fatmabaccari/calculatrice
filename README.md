# Generate C source files from Flex and Bison
flex calculatrice.l
bison -d calculatrice.y

# Compile the generated C files
gcc lex.yy.c calculatrice.tab.c -o calculatrice -lm

# Run the calculator
./calculatrice
