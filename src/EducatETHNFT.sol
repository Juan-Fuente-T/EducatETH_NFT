// SPDX-License-Identifier: MIT
// Compatible with OpenZeppelin Contracts ^5.0.0
pragma solidity ^0.8.4;

import "../lib/forge-std/openzeppelin/ERC721.sol";
import "../lib/forge-std/openzeppelin/Ownable.sol";

contract EducatETHNFT is ERC721, Ownable {
    uint256 private _nextTokenId;

    constructor(address initialOwner)
        ERC721("EducateETH NFT", "EEN")
        Ownable(initialOwner)
    {}

    function _baseURI() internal pure override returns (string memory) {
        return "https://ipfs.io/ipfs/Qmb1pPgnYwdCEZoiysEvyFApdvTjcKt46LjTzCjqh5f41d";
    }

    function safeMint(address to) public onlyOwner {
        uint256 tokenId = _nextTokenId++;
        _safeMint(to, tokenId);
    }
}
