contract Election {
    // Candidate model
    struct Candidate {
        uint id;
        string name;
        uint voteCount;
    }

    // Store Voters Accounts
    mapping(address => bool) public voters;

    // Fetch Candidate 
    mapping(uint => Candidate) public candidates;

    // Store Candidate Count 
    uint public candidatesCount ;

    // voted event
    event votedEvent (
        uint indexed _candidateId
    );

    
    // Constructor

    constructor () public {
        addCandidate("T.W.O");
        addCandidate("Chris");
    }

    
    function addCandidate (string memory _name) private {
        candidatesCount ++;
        candidates[candidatesCount] = Candidate(candidatesCount, _name, 0);
    }

    function vote (uint _candidateId) public {
        // Require voter hasn't voted before
        require(!voters[msg.sender]);


        // Require a valid candidate
        require(_candidateId > 0 && _candidateId <= candidatesCount);

        // Record voting status 
        voters[msg.sender] = true;

        // Update candidates votes 
        candidates[_candidateId].voteCount ++;

          // trigger voted event
        emit votedEvent(_candidateId);

    }
}