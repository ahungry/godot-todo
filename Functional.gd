# Make some "functional" type calls.
var fns = {} #Dictionary.new()

func pprint(s):
	printt(s)
	return s

	# Call Composed
func cc(name, arg):
	return fns[name].fn1.call_func(fns[name].fn2.call_func(arg))

	# This "works" but is real rough.
func compose(name, ctx1, f1, ctx2, f2):
	var d = {}
	#var d = Dictionary.new()
	d.fn1 = funcref(ctx1, f1)
	d.fn2 = funcref(ctx2, f2)
	fns[name] = d

	#func concat(a, b, j): return str(a + j + b)
func sum(a, b): return a + b
func difference(a, b): return a - b
func product(a, b): return a * b
func quotient(a, b): return a / b
func inc(a): return a + 1
func dec(a): return a - 1
func odd(a): return a % 2 != 0
func even(a): return a % 2 == 0

# Fn should be unary (arity/1)
func map(ctx, fn, col):
	var res = []
	for i in range(0, col.size()):
		res.push_back(ctx.call(fn, col[i]))
	return res

func filter(ctx, fn, col):
	var res = []
	for i in range(0, col.size()):
		var r = ctx.call(fn, col[i])
		if r == true:
			res.push_back(col[i])
	return res

# Fn should be binary (arity/2)
func reduce(ctx, fn, col, initial):
	var res = initial
	for i in range(0, col.size()):
		res = ctx.call(fn, res, col[i])
	return res
