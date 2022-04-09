/*
 * Copyright (c) 2022 XXIV
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in all
 * copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
 * SOFTWARE.
 */
import os
import rand

const upper_letters = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
const letters = "abcdefghijklmnopqrstuvwxyz"
const symbols = "!\";#$%&'()*+,-./:;<=>?@[]^_`{|}~"
const numbers = "0123456789"

fn generator(length int,include bool) {
	mut password := ""
	mut array := [upper_letters, letters, numbers]
	if include {
		array = [upper_letters, letters, symbols, numbers]
	}
	for _ in 0..length {
		choose := array[rand.intn(array.len)]
		pass := choose[rand.intn(choose.len)].ascii_str()
		password += pass
	}
	println("\nGenerated password: " + password)
}

fn main() {
	length := os.input("Password length: ").int()
	if length == 0 {
		print("Something went wrong")
		exit(1)
	}
	if length < 6 {
		print("Something went wrong: The lowest number is 6")
		exit(1)
	}
	include := os.input("Include symbols : (yes) ")
	mut not_include := false
	if include.trim_space().len == 0 || include.trim_space() == "yes" || include.trim_space() == "true" {
		not_include = true
	}
	generator(length, not_include)
}