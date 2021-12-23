const { expect } = require("chai");


describe("Card contract", function () {
  
  let Card;
  let deployedCard;
  let owner;
  let addr1;
  let addr2;
  let addrs;


  beforeEach(async function () {

    Card = await ethers.getContractFactory("Card");
    [owner, addr1, addr2, ...addrs] = await ethers.getSigners();

    deployedCard = await Card.deploy();

  });

  describe("Deployment", function () {

    it("Should set the right owner", async function () {
  
      expect(await deployedCard.owner()).to.equal(owner.address);
    });
  });

  describe("Mint", function() {

    it("Should success make nft", async ()=>{
        await deployedCard.mint("test_card",owner.address);
        const card = await deployedCard.getCardInfo(0);
        expect(card.name).to.equals("test_card");
    })
  })
});
