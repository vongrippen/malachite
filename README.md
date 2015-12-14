### Emerald

A RubyGem and Go Package which enables calling Go code from Ruby.


### Write a Go Shared Object


```go
package main

import "strings"
import "github.com/zhubert/emerald/go/emerald"
import "C"

//export upcase
func upcase(data *C.char) *C.char {
	things := []string{}
	err := emerald.Unmarshal(data, &things)
	if err != nil {
		return emerald.Error(err)
	}
	upperCased := []string{}
	for _, thing := range things {
		upperCased = append(upperCased, strings.ToUpper(thing))
	}
	return emerald.Marshal(upperCased)
}

func main() {}
```

### Invocation in Ruby


```ruby
client = Emerald::Client.new(file_path: 'upcase.go', method: 'upcase')
client.call(['foo','bar'])
```

### Rails

Gemfile:

```ruby
gem 'emerald', github: 'zhubert/emerald'
```

client = Emerald::Client.new(file_path: 'upcase.go', method: 'upcase')
