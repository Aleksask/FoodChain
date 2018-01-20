pragma solidity ^0.4.4;

contract ProofOfExistence3 {
    mapping(bytes32 => bool) proofs;

    function storeProof(bytes32 proof) {
        proofs[proof] = true;
    }

    function notarize(string doc) {
        var proof = proofFor(doc);
        storeProof(proof);
    }

    function proofFor(string doc) constant returns (bytes32) {
        return sha256(doc);
    }

    function checkDoc(string doc) constant returns (bool) {
        var proof = proofFor(doc);
        return hasProof(proof);
    }

    function hasProof(bytes32 proof) constant returns (bool) {
        return proofs[proof];
    }
}
