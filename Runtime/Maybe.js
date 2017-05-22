/*
    These are the constructors for Maybe on the JavaScript side.
    The corresponding Elm code looks like this:

    type Maybe a
        = Just a
        | Nothing
*/
var _elm_lang$core$Maybe$Nothing = {ctor: 'Nothing'};

var _elm_lang$core$Maybe$Just = function (a) {
	return {ctor: 'Just', _0: a};
};


/*
    Here are some other simple functions for Maybe with
    their Elm version alongside.
*/


/*
    withDefault : a -> Maybe a -> a
    withDefault default maybe =
        case maybe of
            Just value -> value
            Nothing -> default
*/
var _elm_lang$core$Maybe$withDefault = F2(
	function ($default, maybe) {
		var _p0 = maybe;
		if (_p0.ctor === 'Just') {
			return _p0._0;
		} else {
			return $default;
		}
	});


/*
    map : (a -> b) -> Maybe a -> Maybe b
    map f maybe =
        case maybe of
            Just value -> Just (f value)
            Nothing -> Nothing
*/
var _elm_lang$core$Maybe$map = F2(
	function (f, maybe) {
		var _p2 = maybe;
		if (_p2.ctor === 'Just') {
			return _elm_lang$core$Maybe$Just(
				f(_p2._0));
		} else {
			return _elm_lang$core$Maybe$Nothing;
		}
	});
