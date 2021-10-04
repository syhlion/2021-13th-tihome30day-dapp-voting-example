// SPDX-License-Identifier: MIT
pragma solidity >=0.4.21 <0.6.0;

contract Voting {

    //紀錄名稱與投票的數字
	mapping (bytes32 => uint8) public votesReceived;

    //候選提案列表
	bytes32[] public candidateList;

    //建構子
	constructor( bytes32[] memory candidateNames) public {
		candidateList = candidateNames;
	}
    //檢查投票選項有效性
	function validCandidate(bytes32 candidate) view public returns (bool) {
		for(uint i = 0; i < candidateList.length; i++) {
			if (candidateList[i] == candidate) {
				return true;
			}
		}
		return false;
	}
    //增加票數
	function addVote(bytes32 candidate) public {
		require(validCandidate(candidate));
		votesReceived[candidate] += 1;
	}

    //查詢某選項的票數
	function queryVotes(bytes32 candidate) view public returns (uint8) {
		require(validCandidate(candidate));
		return votesReceived[candidate];
	}

}
