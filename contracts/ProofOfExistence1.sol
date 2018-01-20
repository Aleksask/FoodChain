pragma solidity ^0.4.4;

contract ProofOfExistence1 {
    bytes32 public proof;

    function notorize(string doc) {
        proof = proofFor(doc);
    }

    function proofFor(string doc) constant returns (bytes32) {
        return sha256(doc);
    }
}
