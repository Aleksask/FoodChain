contract MultiplyTest {

	uint _multiplier;

	function test(uint multiplier){
		 _multiplier = multiplier;
	}

	function multiply(uint a) returns(uint d) {
		 return a * _multiplier;
	}
}