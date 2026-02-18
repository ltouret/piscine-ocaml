.PHONY: all clean fclean re

OCAMLOPT = ocamlopt
EXEC = a.out
SOURCES = atom.ml molecule.ml alkane.ml reaction.ml main.ml

all: $(EXEC)

$(EXEC): $(SOURCES)
	$(OCAMLOPT) -o $(EXEC) $(SOURCES)

clean:
	rm -f *.cmi *.cmx *.o *.cmo

fclean: clean
	rm -f $(EXEC)

re: fclean all