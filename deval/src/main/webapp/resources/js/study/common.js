/**
 * 
 */

function NullEmpty(parm){
	if(parm == null || parm == ""){
		return true;
	} 
	
	return false;
}

function Checked(parm){
	var checkVal;
	
	parm.each(function() {
		checkVal = $(this).val();
	});
	
	NullEmpty(checkVal);
}