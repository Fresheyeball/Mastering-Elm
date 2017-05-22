/*
module TEA.Counter exposing (..)

import Html exposing (program)
import Html.Events
import Html.Attributes

type Count
    = Count

type alias Knocks =
    Int

main : Program Never Knocks Count
main =
    program
        { init = ( 0, Cmd.none )
        , update = \Count knocks -> ( knocks + 1, Cmd.none )
        , view = \knocks ->
                Html.div
                    [ Html.Attributes.style
                        [ ( "padding", "20px" ) ]
                    ]
                    [ Html.h3 []
                        [ Html.text ("Knocks: " ++ toString knocks) ]
                    , Html.button
                        [ Html.Events.onClick Count ]
                        [ Html.text "Count" ]
                    ]
        , subscriptions = \knocks -> Sub.none
        }
*/

var _fresheyeball$its_actually_on_gitlab$TEA_Counter$Count = {ctor: 'Count'};
var _fresheyeball$its_actually_on_gitlab$TEA_Counter$main = _elm_lang$html$Html$program(
	{
		init: {ctor: '_Tuple2', _0: 0, _1: _elm_lang$core$Platform_Cmd$none},
		update: F2(
			function (_p0, knocks) {
				var _p1 = _p0;
				return {ctor: '_Tuple2', _0: knocks + 1, _1: _elm_lang$core$Platform_Cmd$none};
			}),
		view: function (knocks) {
			return A2(
				_elm_lang$html$Html$div,
				{
					ctor: '::',
					_0: _elm_lang$html$Html_Attributes$style(
						{
							ctor: '::',
							_0: {ctor: '_Tuple2', _0: 'padding', _1: '20px'},
							_1: {ctor: '[]'}
						}),
					_1: {ctor: '[]'}
				},
				{
					ctor: '::',
					_0: A2(
						_elm_lang$html$Html$h3,
						{ctor: '[]'},
						{
							ctor: '::',
							_0: _elm_lang$html$Html$text(
								A2(
									_elm_lang$core$Basics_ops['++'],
									'Knocks: ',
									_elm_lang$core$Basics$toString(knocks))),
							_1: {ctor: '[]'}
						}),
					_1: {
						ctor: '::',
						_0: A2(
							_elm_lang$html$Html$button,
							{
								ctor: '::',
								_0: _elm_lang$html$Html_Events$onClick(_fresheyeball$its_actually_on_gitlab$TEA_Counter$Count),
								_1: {ctor: '[]'}
							},
							{
								ctor: '::',
								_0: _elm_lang$html$Html$text('Count'),
								_1: {ctor: '[]'}
							}),
						_1: {ctor: '[]'}
					}
				});
		},
		subscriptions: function (knocks) {
			return _elm_lang$core$Platform_Sub$none;
		}
	})();
