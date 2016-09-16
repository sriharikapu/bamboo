ocamlbuild -Is ast,parse,lib,codegen -use-menhir parse/parser_test.native && \
ocamlbuild -Is ast,parse,lib,codegen -use-menhir ast/ast_test.native && \
ocamlbuild -Is ast,parse,lib,codegen -use-menhir codegen/codegen_test.native && \
for f in `ls parse/examples/*.sol`
do
  echo "trying" $f
  cat $f | ./parser_test.native || \
  exit 1
  cat $f | ./ast_test.native || \
  exit 1
done && \
./codegen_test.native || \
exit 1
