import java.io.File

var letterCount = 0
var lineCount = 0

File("./input.txt").forEachLine { line ->
	lineCount++
	letterCount += line.length
}

File("./hey.txt").writeText("""input.txt has ${lineCount} lines and in total ${letterCount} letters""")
