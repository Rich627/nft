// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract MyToken is ERC721, Ownable {
    constructor() ERC721("Rich's NFT", "Rich") {}

    string public baseURI="ipfs://";
    uint256 public _tokenId;

    function safeMint(address to, uint256 tokenId) public  {
        _safeMint(to, tokenId);
    }

    function setURI(string memory uri) public onlyOwner{
        baseURI=uri;
    }
    function _baseURI() override internal view virtual returns (string memory) {
        return baseURI;
    }

    function tokenURI(uint256 tokenId) public view virtual override returns (string memory) {
        _requireMinted(tokenId);

        return baseURI;
    }

    function mint() public {
        _safeMint(msg.sender, _tokenId);
        _tokenId++;
    }
}