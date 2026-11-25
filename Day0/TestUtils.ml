#!/usr/bin/env ocaml

#use "../utils.ml"

(* Day0 is more like a utils test *)

let () =
  print_string @@ read_file_as_single_string "./test_input.txt";
  let test_pow_of_3 n = pow 3 n |> Printf.printf "pow 3 %d => %d\n" n in
  [ 0; 1; 3; 10; 123; 1234; -1 ] |> List.iter test_pow_of_3
