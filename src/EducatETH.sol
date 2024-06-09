// SPDX-License-Identifier: AGPL-3.0-only
pragma solidity >=0.8.0;

import "lib/forge-std/openzeppelin/ERC1155.sol";

/// @title EducatETH - A simple ERC1155 NFT contract
/// @notice This contract allows the creation of NFTs with the same metadata for all tokens.
/// @dev This contract inherits from the Solmate ERC1155 implementation.
contract EducatETH is ERC1155 {
     /// @notice The name of the NFT collection
    string public name = "EducatETH NFT";
    /// @notice The symbol of the NFT collection
    string public symbol = "EEN";
    /// @notice The base URI for the metadata of the NFTs
    /// @dev This URI points to the IPFS hash of the metadata JSON file.
    string public constant baseURI = "https://ipfs.io/ipfs/Qmb1pPgnYwdCEZoiysEvyFApdvTjcKt46LjTzCjqh5f41d";

    /// @notice Constructor that mints an initial NFT to the owner
    /// @param owner The address of the owner who will receive the initial minted NFT
    constructor(address owner) {
        mint(owner, 1, 1);  // Mintea un NFT con id 1 y cantidad 1 al creador del contrato
    }

    /// @notice Returns the URI for the metadata of a given token ID
    /// @param id The ID of the token (not used in this implementation, but required by the ERC1155 standard)
    /// @return The base URI for the metadata
    function uri(uint256 id) public pure override returns (string memory) {
        return baseURI;
    }

    /// @notice Mints a specified amount of a given token ID to a specified address
    /// @param to The address to which the tokens will be minted
    /// @param id The ID of the token to be minted
    /// @param amount The quantity of the token to be minted
    function mint(address to, uint256 id, uint256 amount) public {
        _mint(to, id, amount, "");
        emit URI(baseURI, id);
    }
    
    /// @notice Mints specified amounts of multiple token IDs to a specified address
    /// @param to The address to which the tokens will be minted
    /// @param ids An array of token IDs to be minted
    /// @param amounts An array of quantities of each token ID to be minted
    function mintBatch(address to, uint256[] memory ids, uint256[] memory amounts) public {
        _batchMint(to, ids, amounts, "");
        for (uint256 i = 0; i < ids.length; i++) {
            emit URI(baseURI, ids[i]);
        }
    }
}
