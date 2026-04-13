import java.io.File

fun parseInput(inputname: String): List<Pair<Int,Int>> {
	File("./input.txt").readText().split(",")
}

