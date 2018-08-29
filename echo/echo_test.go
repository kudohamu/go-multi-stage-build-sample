package echo

import "testing"

func TestEcho(t *testing.T) {
	if Echo("test") != "test" {
		t.Fatal("failed echo test")
	}
}
