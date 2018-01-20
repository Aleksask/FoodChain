pragma solidity ^0.4.4;

contract ProofOfExistence2 {
    bytes32[] proofs;

    function storeProof(bytes32 proof) {
        proofs.push(proof);
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
        for (uint256 i = 0; i < proofs.length; i++) {
            if (proof == proofs[i]) {
                return true;
            }
        }
        return false;
    }
}
