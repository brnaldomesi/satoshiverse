# Satoshiverse Avatar Project
` Built by Herasoft for Apollo NFT` 
> - Claim your Satoshiverse Avatar based on a series of available NFTs in the Satoshiverse. 
> - Avatars are hashed to IPFS and provably random with fair minting distribution based on Chainlink VRF and a HyperScript for decision trees. 


# Window of Opportunity 
Distribution (Target start: Early/Mid November)
Phased distribution based on token category.
Schedule:
> ` Day 1: 11:00 AM EST – 5:00 PM EST`
- Genesis
> ` Day 1-2: 5:00 PM EST- 11:00 AM EST`
- Genesis
- Platinum
> ` Day 2-3: 11:00 AM EST – 11:00 AM EST `
- Genesis
- Platinum
- Gold
> `Day 3-4: 11:00 AM EST – 11:00 AM EST `
- Genesis
- Platinum
- Gold
- Silver
> `Day 4-7: 11:00 AM EST – 11:00 AM EST `
- Genesis
- Platinum
- Gold
- Silver
- Bronze
> ` Day 7 : 12:00 PM EST`
- If sold out through presale
All remaining legionnaires minted and sent to designated holding account.
If not sold out through presale

`Unclaimed Legionnaires (difference between number of legionnaires claimed and number of presale tokens sold) minted and sent to designated holding account (the goal here would just be to have legionnaires on hold for anyone who bought a token but forgot to claim).`


# Randomization Script 
` Chainlink VRF `
> - setTokenHash [ tokenId ] , [ ipfsHash]


# Legionnaire Reveal
- `Upon Minting – User receives actual NFT with placeholder GIF and “Hidden” Trait`
- `Reveal/Update Metadata 24-48 hours (TBD) after final editions are minted.`
`Distribution Technical Requirements`
- We discussed 2 alternatives for how we can achieve our goals above from a technical perspective and prevent people from transferring their tokens and then claiming again: 
- (1) whitelist and 
- (2) claim based on number of tokens held with some sort of control for transfers.
`Either way, it seems we would need to announce and make very clear that after either the snapshot for the whitelist or the beginning of the distribution, tokens that are transferred will not be eligible to claim Legionnaires.  Based on the discussion the three of us had and Miguel and I chatting, we see two potential ways we could do this and would like your advice on which one is best:`

# Snapshot/Whitelist Method
`Hypothetically: Day 1 of claim is set to begin November 14th at 12:00 PM EST. Snapshot is taken as close to that time as possible. The whitelist addresses and number of tokens held for each presale token are loaded into the smart contract. The collectors can then claim however many tokens of each they hold during each of the designated windows (note that if a person holds more than one type of 	token, they will either need to wait until the last period or claim using different tokens on different days). `
- We would announce that any tokens transferred after the snapshot would not be eligible to receive a Legionnaire.

# Questions
`How close to the launch time can we take the snapshot?`
- I would do 24 hours

`Will adding a whitelist add complexity to the process or can all of that be automated?`
- Should be fine
`Do we insert the potential for human error here?`
- If you download and transfer the wrong csv 
`Claim/Query Method`
- Hypothetically: Day 1 of claim is set to begin November 14th at 12:00 PM EST. When a token holder goes to claim their legionnaire during their respective period the blockchain is queried for how many of any particular token the user held on Nov. 14th at 12:00 PM EST. The user is then able to claim legionnaires based upon the amount of tokens they held at that time (note that if a person holds more than one type of token, they will either need to wait until the last period or claim using different tokens on different days).
`We would announce that any tokens transferred after November 14th at 12:00 PM EST will not be eligible to redeem a Legionnaire. `
# Questions
`Will this increase the gas cost for the transaction?`
`Potential Advantage`
`We like this method because everything is being determined by the smart contract at the time of minting. So once the method is tested, it seems there is less room for error. But we want to be sure that we aren’t missing anything and that this isn’t going to increase gas costs (at least not significantly).`
This also seems more transparent.
# How Traits Will Be Generated And Assigned To Each Token
- `We are still in the process of finalizing the type of traits and total number of traits etc, but generally speaking traits will be assigned as follows
Using a string of random numbers that we generate (method TBD) we determine the traits. We will call this string of random numbers an input. We split the input into several parts, each corresponding to a trait. The mapping of inputs to traits is predetermined based on a translator/codex. `
- `Using several computers (10-20) we will execute a script that takes a set of inputs and for each input it opens up the Unreal Editor, immediately altering the legionnaire and its surroundings inside the editor. Once this has loaded, a recording is rendered and once it finishes rendering, the editor is closed and an FFMPEG script is run in order to convert the AVI video file to a lower size MP4. Finally, we upload this mp4 to a temporary private file storage. `
- `During the rendering process, once a set of legionnaires has been rendered, the traits get stored on metadata json files. These json files are stored privately for now.`
- `The 7 day claiming process then begins. Once a legionnaire is claimed, it will have a placeholder URI which includes a placeholder GIF and a set of traits which is a single trait that says Hidden.`
- `After all tokens have been minted but prior to the reveal, we upload the videos that are on our private file storage to IPFS. `
- `We then update the JSON files for each legionnaire to include the video IPFS URI corresponding to that legionnaire. Now we have 10,000 complete JSON files with both the traits and the video IPFS URI.`
- `These 10000 complete json files are handed over to Herasoft to be uploaded to IPFS and once Herasoft has uploaded them, Herasoft will compile a list with these 10,000 IPFS URIs which correspond to the json files.`
- `Herasoft should then use some sort of provably random method (VRF etc.) to pair the 10,000 IPFS URIs with the Tokens. `
- `Then shortly before the planned reveal time, Herasoft should update the token metadata for each token so that the placeholder GIF and the placeholder “Hidden” trait are replaced by the IPFS URI and actual traits that have been assigned. `
- `At that point we should be able to tell users to simply refresh their metadata on opensea (or see if Opensea will do it for us for the whole collection). `

# And BOOM they have their legionnaires. 

============================================
# How to Build

This project demonstrates a the Satoshiverse Avatar Claim Project. We decided to leverage HardHat framework for a modern web3 stack.

To get started try running some of the following tasks:

```shell
nvm use 15.14.0
npx i
npx hardhat accounts
npx hardhat compile
npx hardhat clean
npx hardhat test
npx hardhat node
node scripts/sample-script.js
npx hardhat help
```
