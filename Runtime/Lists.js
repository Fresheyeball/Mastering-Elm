/*
    Lists in functional languages tend to have the following structure:

    type List a = Cons a (List a) | Nil

    and then recieve synatic sugar from the compiler such, so that we can write:

    [1,2,3]

    instead of

    Cons 1 (Cons 2 (Cons 3 Nil))

    Elm is no exception. Nil is represented as [] and Cons is represetned as ::

    Here is the JavaScript code for Lists:
*/

var Nil = { ctor: '[]' };

function Cons(hd, tl)
{
	return {
		ctor: '::',
		_0: hd,
		_1: tl
	};
}

function append(xs, ys)
{
	// append Strings
	if (typeof xs === 'string')
	{
		return xs + ys;
	}

	// append Lists
	if (xs.ctor === '[]')
	{
		return ys;
	}
	var root = Cons(xs._0, Nil);
	var curr = root;
	xs = xs._1;
	while (xs.ctor !== '[]')
	{
		curr._1 = Cons(xs._0, Nil);
		xs = xs._1;
		curr = curr._1;
	}
	curr._1 = ys;
	return root;
}
