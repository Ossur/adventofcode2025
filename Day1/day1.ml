#! /bin/env ocaml

#use "./utils.ml"

let () =
  let _ =
    powerr 3 |> string_of_int |> ( ^ ) "Ayyyy macharena " |> print_string
  in
  print_string @@ ( ^ ) "Ayyy macharena " @@ string_of_int @@ powerrr 3
