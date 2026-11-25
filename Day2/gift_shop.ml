#!/usr/bin/env ocaml

#use ../utils.ml


let () = 

  let parse str = 
    let parse_range str = 
      match str |> String.split_on_char '-' |> List.map int_of_string with
      | [ a ; b ] -> a, b
      | _ -> failwith @@ Printf.sprintf "Bad input, %s did not parse as a range" str
    in
    str |> String.split_on_char ',' |> List.map parse_range
  in

  let pow n p = float_of_int n ** float_of_int p |> int_of_float in

  let rec sum_of_invalids_in_range sum_so_far (i, j) = 
    if i > j then 
      sum_so_far
    else 
      let dig_n = digit_num i in 
      if dig_n mod 2 = 1 then 
          sum_of_invalids_in_range sum_so_far ((pow 10 dig_n), j)
      else
        (* here dig_n = 2 * n  *)
        let n = dig_n / 2 in
        let first_half = i / (pow 10 n) in 
        let second_half = i - (first_half * (pow 10 n)) in
        if first_half = second_half then 
          sum_of_invalids_in_range (sum_so_far + i) ((i + 1), j)
        else if first_half > second_half then 
          let min_i = first_half * (pow 10 n) + first_half in 
          sum_of_invalids_in_range sum_so_far (min_i, j)
        else
         sum_of_invalids_in_range sum_so_far ((i + 1), j)
  in
  
  let rec sum_of_actual_invalids_in_range sum_so_far (i, j) = 
    if i > j then 
      sum_so_far
    else 
      let dig_n = digit_num i in 
      let get_factors n = 
        List.range 1 (n/2) |> List.filter (fun x -> (n mod x) = 0)
      in
      get_factors dig_n |> 
  in

  let test_lines = In_channel.with_open_bin "./AoC2025_2_testinput.txt" In_channel.input_lines in 
  let lines = In_channel.with_open_bin "./AoC2025_2_input.txt" In_channel.input_lines in 

  let get_sum_of_all_invalids input_lines =
      input_lines |> List.map parse |> List.flatten 
               |> List.map (sum_of_invalids_in_range 0)
               |> List.fold_left (+) 0 
  in

  test_lines |> get_sum_of_all_invalids |> Printf.printf "Invalid test id sum: %d\n";

  lines |> get_sum_of_all_invalids |> Printf.printf "Actually the password: %d\n";
