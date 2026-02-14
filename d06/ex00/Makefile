.PHONY: all clean fclean re

OCAMLOPT = ocamlopt
EXEC = a.out

all: $(EXEC)

$(EXEC):
	$(OCAMLOPT) -o $(EXEC) people.ml main.ml

clean:
	rm -f *.cmi *.cmx *.o *.cmo

fclean: clean
	rm -f $(EXEC)

re: fclean all