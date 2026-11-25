let rec pow n p =
  match p with
  | 0 -> 1
  | 1 -> n
  | _ when p > 1 -> n * (pow n (p - 1))
  | _ -> failwith "ERROR: Integer to a negative power would result in a float"

(* Modulus like on a clock, only positive numbers, negative starts from the top *)
let pos_mod m n =
  ((n mod m) + m) mod m

(* get the quantity of digits in the base 10 representation of a givin integer x *)
let digit_qty x = 
  let rec h x n = if x = 0 then n else h (x / 10) (n + 1) in
  match x with 
  | 0 -> 1
  | _ -> h x 0

(* get subdigits from a base 10 representation of a given integer x, 
   where i is the starting position of i (0-indexed) with length l
   *)
let digit_sub x i l =
  let dlen = digit_qty x in
  if (i + l) > dlen then
    failwith (Printf.sprintf "ERROR: integer %d is too short to contain a %d long subdigit from digit %d" x l i)
  else
    let trim_front x = x mod (pow 10 dlen) in
    let trim_back x = x / (pow 10 (dlen - i - l)) in
    x |> trim_front |> trim_back

let read_file_as_single_string filename =
  let ic = open_in filename in
  let contents = really_input_string ic @@ in_channel_length ic in
  close_in ic;
  contents
