// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "token.sol";
 
contract nftToken is ERC721{
     constructor(uint initialSuppply) ERC721("shinningstar", "star"){

     }
     function mint(address to, uint tokenId) public {
         _mint(to, tokenId);
     }
}

contract flight {
      nftToken public tokenNft;
      address public  owner;                                                                                                                                                         
      tokenstar public  token20;
      uint public   _Ticketprice;
      string  public   _time;
      uint8 public F_C_TicketNo =0;    //  for first class ticket
      uint public  B_C_TiketNo=10;      //  for businness class ticket
      uint public  P_Eco_TicketNo=20;   //  for premium economy class ticket
      uint public  E_C_TicketNo=30;      //  for economy class ticket



      struct ticket{
        string name;
        string source;
        string destination;
        string date;
        string cabin_class;
        bool booked;
    }
    
    mapping (uint => ticket) public ticketBooked;
    mapping(address => bool) public hasPurchasedTicket;
    
    event Purchased(uint  ticketNo, address  passenger);
    event price_time(uint _Ticketprice, string _time ); 
    
  

    constructor(address _NFTtoken ,address _token20){   
            tokenNft = nftToken(_NFTtoken);
            token20=tokenstar(_token20);
            owner = msg.sender;
            for(uint i=0; i<=50;i++){
                tokenNft.mint(address(this),i);
            }
    }

    function flight_detail()public pure returns (string memory, string memory, string memory){
        return(
                "From Karachi to IslamaBad  : Economy Class Ticket price is 120",
                "From Lahore to Karach      : Economy Class Ticket price is 100",
                "From Multan to Karachi     : Economy Class Ticket price is 200"
                 
          );
    }

    function Cabin_Class() public pure returns (string memory, string memory, string memory, string memory){
        return (
                 "Economy_Class", 
                 "Premium_Economy  :you have to pay 5% extra charges than Economy class charge",
                 "Business_Class   :you have to pay 10% extra charges than Economy class charge",
                 "First_Class      :you have to pay 15% extra charges than Economy class charge"
                 
        );
    }

    function detailtoBook( string memory _source, 
                         string memory _destination, 
                         string memory _date, 
                         string memory _cabin_class
             ) public  returns(uint  , string memory) {
                 uint Ticketprice;
                 Ticketprice=_Ticketprice;
                 string memory time;
                 time=_time;
                   
    if (keccak256(abi.encodePacked(_cabin_class))==keccak256(abi.encodePacked("Economy Class"))) {
        if (keccak256(abi.encodePacked(_source))==keccak256(abi.encodePacked("Karachi"))) {
            if (keccak256(abi.encodePacked(_destination))==keccak256(abi.encodePacked("Islamabad"))) {
                if (keccak256(abi.encodePacked(_date))==keccak256(abi.encodePacked("20-sep-2023"))) {
                       _Ticketprice = 120;
                       _time = "2pm";


                }
            }
        }
    } else if (keccak256(abi.encodePacked(_cabin_class))==keccak256(abi.encodePacked("Premium Economy"))) {
               if (keccak256(abi.encodePacked(_source))==keccak256(abi.encodePacked("Karachi"))) {
                   if (keccak256(abi.encodePacked(_destination))==keccak256(abi.encodePacked("Islamabad"))) {
                       if (keccak256(abi.encodePacked(_date))==keccak256(abi.encodePacked("20-sep-2023"))) {
                              _Ticketprice=120+((120*5)/100);
                              _time="2pm";
                }
            }
        }
    } else if (keccak256(abi.encodePacked(_cabin_class))==keccak256(abi.encodePacked("Business Class"))) {
               if (keccak256(abi.encodePacked(_source))==keccak256(abi.encodePacked("Karachi"))) {
                   if (keccak256(abi.encodePacked(_destination))==keccak256(abi.encodePacked("Islamabad"))) {
                       if (keccak256(abi.encodePacked(_date))==keccak256(abi.encodePacked("20-sep-2023"))) {
                              _Ticketprice=120+((120*10)/100);
                              _time="2pm";
                }
            }
        }
    } else if (keccak256(abi.encodePacked(_cabin_class))==keccak256(abi.encodePacked("First Class"))) {
              if (keccak256(abi.encodePacked(_source))==keccak256(abi.encodePacked("Karachi"))) {
                 if (keccak256(abi.encodePacked(_destination))==keccak256(abi.encodePacked("Islamabad"))) {
                    if (keccak256(abi.encodePacked(_date))==keccak256(abi.encodePacked("20-sep-2023"))) {
                           _Ticketprice=120+((120*15)/100);
                           _time="2pm";
                }
            }
        }
    }  if (keccak256(abi.encodePacked(_cabin_class))==keccak256(abi.encodePacked("Economy Class"))) {
               if (keccak256(abi.encodePacked(_source))==keccak256(abi.encodePacked("Lahore"))) {
                  if (keccak256(abi.encodePacked(_destination))==keccak256(abi.encodePacked("Karachi"))) {
                     if (keccak256(abi.encodePacked(_date))==keccak256(abi.encodePacked("20-sep-2023"))) {
                            _Ticketprice = 100;
                             _time = "6pm";
                }
            }
        }
    } else if (keccak256(abi.encodePacked(_cabin_class))==keccak256(abi.encodePacked("Premium Economy"))) {
               if (keccak256(abi.encodePacked(_source))==keccak256(abi.encodePacked("Lahore"))) {
                   if (keccak256(abi.encodePacked(_destination))==keccak256(abi.encodePacked("Karachi"))) {
                       if (keccak256(abi.encodePacked(_date))==keccak256(abi.encodePacked("20-sep-2023"))) { 
                              _Ticketprice=100+((100*5)/100);
                              _time="6pm";
                }
            }
        }
    }else if (keccak256(abi.encodePacked(_cabin_class))==keccak256(abi.encodePacked("Business Class"))) {
               if (keccak256(abi.encodePacked(_source))==keccak256(abi.encodePacked("Lahore"))) {
                   if (keccak256(abi.encodePacked(_destination))==keccak256(abi.encodePacked("Karachi"))) {
                       if (keccak256(abi.encodePacked(_date))==keccak256(abi.encodePacked("20-sep-2023"))) { 
                              _Ticketprice=100+((100*10)/100);
                              _time="6pm";
                }    
            }
        }
    } else if (keccak256(abi.encodePacked(_cabin_class))==keccak256(abi.encodePacked("First Class"))) {
               if (keccak256(abi.encodePacked(_source))==keccak256(abi.encodePacked("Lahore"))) {
                   if (keccak256(abi.encodePacked(_destination))==keccak256(abi.encodePacked("Karachi"))) {
                       if (keccak256(abi.encodePacked(_date))==keccak256(abi.encodePacked("20-sep-2023"))) {
                            _Ticketprice=100+((100*15)/100);
                                   _time="6pm";
                }
            }
        }
    }  if (keccak256(abi.encodePacked(_cabin_class))==keccak256(abi.encodePacked("Economy Class"))) {
               if (keccak256(abi.encodePacked(_source))==keccak256(abi.encodePacked("Multan"))) {
                   if (keccak256(abi.encodePacked(_destination))==keccak256(abi.encodePacked("Karachi"))) {
                       if (keccak256(abi.encodePacked(_date))==keccak256(abi.encodePacked("20-sep-2023"))) {
                               _Ticketprice = 200;
                               _time = "2am";
                }
            }
        }
    } else if (keccak256(abi.encodePacked(_cabin_class))==keccak256(abi.encodePacked("Premium Economy"))) {
               if (keccak256(abi.encodePacked(_source))==keccak256(abi.encodePacked("Multan"))) {
                   if (keccak256(abi.encodePacked(_destination))==keccak256(abi.encodePacked("Karachi"))) {
                       if (keccak256(abi.encodePacked(_date))==keccak256(abi.encodePacked("20-sep-2023"))) {
                               _Ticketprice=200+((200*5)/100);
                               _time="2am";
                }
            }
        }
    } else if (keccak256(abi.encodePacked(_cabin_class))==keccak256(abi.encodePacked("Business Class"))) {
               if (keccak256(abi.encodePacked(_source))==keccak256(abi.encodePacked("Multan"))) {
                   if (keccak256(abi.encodePacked(_destination))==keccak256(abi.encodePacked("Karachi"))) {
                       if (keccak256(abi.encodePacked(_date))==keccak256(abi.encodePacked("20-sep-2023"))) {
                               _Ticketprice=200+((200*10)/100);
                               _time="2am";
                }
                                     
            }
        }
    } else if (keccak256(abi.encodePacked(_cabin_class))==keccak256(abi.encodePacked("First Class"))) {
               if (keccak256(abi.encodePacked(_source))==keccak256(abi.encodePacked("Multan"))) {
                   if (keccak256(abi.encodePacked(_destination))==keccak256(abi.encodePacked("Karachi"))) {
                       if (keccak256(abi.encodePacked(_date))==keccak256(abi.encodePacked("20-sep-2023"))) {
                              _Ticketprice=200+((200*15)/100);
                              _time="2am";
                }
            }
        }
    } else {
                       revert(" category not found");
        }
            
                      emit  price_time( _Ticketprice, _time ); 
                      return (Ticketprice, time);             
   }

    function purchaseTicket(
        string memory _name,
        string memory _source,
        string memory _destination,
        string memory _date,
        string memory _cabin_class,
         bool _isRoundTrip
    ) public returns (uint) {
        require(msg.sender != address(0), "Invalid sender address");
        uint ticketNumber;

        if (keccak256(abi.encodePacked(_cabin_class)) == keccak256(abi.encodePacked("First Class"))) {
            require(F_C_TicketNo <= 10, "No more first Class tickets available.");
            ticketBooked[F_C_TicketNo] = ticket(_name, _source, _destination, _date, _cabin_class,true);
            // Adjust the ticket price based on round-trip flag
            if (_isRoundTrip==true) {
                _Ticketprice = _Ticketprice * 2; // Double the price for round-trip
            } else {
                _Ticketprice = _Ticketprice; // Use regular price for one-way
            }
            token20.transferFrom(msg.sender, address(this), _Ticketprice);
            tokenNft.transferFrom(address(this), msg.sender, F_C_TicketNo);
            emit Purchased(F_C_TicketNo, msg.sender);
            ticketNumber = F_C_TicketNo;
            F_C_TicketNo++;
        } else if (keccak256(abi.encodePacked(_cabin_class)) == keccak256(abi.encodePacked("Business Class"))) {
            require(B_C_TiketNo <= 20, "No more Business tickets available.");
            ticketBooked[B_C_TiketNo] = ticket(_name, _source, _destination, _date, _cabin_class, true);
                if (_isRoundTrip==true) {
                        _Ticketprice = _Ticketprice * 2; // Double the price for round-trip
                    } else {
                         _Ticketprice = _Ticketprice; // Use regular price for one-way
            }
            token20.transferFrom(msg.sender, address(this), _Ticketprice);
            tokenNft.transferFrom(address(this), msg.sender, B_C_TiketNo);
            emit Purchased(B_C_TiketNo, msg.sender);
            ticketNumber = B_C_TiketNo;
            B_C_TiketNo;
        } else if (keccak256(abi.encodePacked(_cabin_class)) == keccak256(abi.encodePacked("Premium Economy"))) {
            require(P_Eco_TicketNo <= 30, "No more premium Economy tickets available.");
            ticketBooked[P_Eco_TicketNo] = ticket(_name, _source, _destination, _date, _cabin_class, true);
                if (_isRoundTrip==true) {
                       _Ticketprice = _Ticketprice * 2; // Double the price for round-trip
                 } else {
                       _Ticketprice = _Ticketprice; // Use regular price for one-way
            }
            token20.transferFrom(msg.sender, address(this), _Ticketprice);
            tokenNft.transferFrom(address(this), msg.sender, P_Eco_TicketNo);
            emit Purchased(P_Eco_TicketNo, msg.sender);
            ticketNumber = P_Eco_TicketNo;
            P_Eco_TicketNo++;
             } else if (keccak256(abi.encodePacked(_cabin_class)) == keccak256(abi.encodePacked("Economy Class"))) {
            require(E_C_TicketNo <=50, "No more Economy tickets available.");
            ticketBooked[E_C_TicketNo] = ticket(_name, _source, _destination, _date, _cabin_class, true);
                  if (_isRoundTrip==true) {
                      _Ticketprice = _Ticketprice * 2; // Double the price for round-trip
                   } else {
                       _Ticketprice = _Ticketprice; // Use regular price for one-way
            }
            token20.transferFrom(msg.sender, address(this), _Ticketprice);
            tokenNft.transferFrom(address(this), msg.sender, E_C_TicketNo);
            emit Purchased(E_C_TicketNo, msg.sender);
            ticketNumber = E_C_TicketNo;
            E_C_TicketNo++;
        } else {
            revert("all seats are booked");
        }

        hasPurchasedTicket[msg.sender] = true;
        return ticketNumber;
    }

     function ticketPrice(uint price)  public{
       require(msg.sender==owner, "only owner can change price");
    
       _Ticketprice=price;
   }
   function withdrawTokens(address to, uint amount) public {
                   if(msg.sender!= owner){
                   revert("you are not owner");
            }
                    token20.transfer(to, amount);
        }
    }