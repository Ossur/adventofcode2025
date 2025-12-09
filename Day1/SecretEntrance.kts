import java.io.File

var letterCount = 0
var lineCount = 0

fun eucledian_modulus(a: Int, m: Int): Int = ((a % m) + m) % m


fun readInputAndCount(inputname: String): Int {
	var clicks = 50
	var onZero = 0
	File(inputname).forEachLine { line ->
		val num = line.substring(1).toInt()
		clicks = when(line[0]) {
			'L' -> clicks - num
			'R' -> clicks + num
			else -> clicks
		}
		clicks = eucledian_modulus(clicks, 100)
		if (clicks == 0){
			onZero++
		}
	}
	return onZero
}


println(readInputAndCount("./test_input.txt"))
println(readInputAndCount("./input.txt"))
