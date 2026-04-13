#! /bin/env ocaml

(* In OCaml let () denotes the main starting point *)
let () =
  Printf.printf "This script was evoked by the name %s !\n" Sys.argv.(0);
  let argsnum = Array.length Sys.argv in
  if argsnum > 1 then Printf.printf "First argument is %s\n" Sys.argv.(1)
  else Printf.printf "It wasn't passed any arguments :(\n"
