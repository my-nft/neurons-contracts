/* Autogenerated file. Do not edit manually. */
/* tslint:disable */
/* eslint-disable */
import { Signer, utils, Contract, ContractFactory, Overrides } from "ethers";
import type { Provider, TransactionRequest } from "@ethersproject/providers";
import type { PromiseOrValue } from "../../common";
import type {
  ModuleManager,
  ModuleManagerInterface,
} from "../../GnosisSafeL2_flattened.sol/ModuleManager";

const _abi = [
  {
    anonymous: false,
    inputs: [
      {
        indexed: false,
        internalType: "address",
        name: "module",
        type: "address",
      },
    ],
    name: "DisabledModule",
    type: "event",
  },
  {
    anonymous: false,
    inputs: [
      {
        indexed: false,
        internalType: "address",
        name: "module",
        type: "address",
      },
    ],
    name: "EnabledModule",
    type: "event",
  },
  {
    anonymous: false,
    inputs: [
      {
        indexed: true,
        internalType: "address",
        name: "module",
        type: "address",
      },
    ],
    name: "ExecutionFromModuleFailure",
    type: "event",
  },
  {
    anonymous: false,
    inputs: [
      {
        indexed: true,
        internalType: "address",
        name: "module",
        type: "address",
      },
    ],
    name: "ExecutionFromModuleSuccess",
    type: "event",
  },
  {
    inputs: [
      {
        internalType: "address",
        name: "prevModule",
        type: "address",
      },
      {
        internalType: "address",
        name: "module",
        type: "address",
      },
    ],
    name: "disableModule",
    outputs: [],
    stateMutability: "nonpayable",
    type: "function",
  },
  {
    inputs: [
      {
        internalType: "address",
        name: "module",
        type: "address",
      },
    ],
    name: "enableModule",
    outputs: [],
    stateMutability: "nonpayable",
    type: "function",
  },
  {
    inputs: [
      {
        internalType: "address",
        name: "to",
        type: "address",
      },
      {
        internalType: "uint256",
        name: "value",
        type: "uint256",
      },
      {
        internalType: "bytes",
        name: "data",
        type: "bytes",
      },
      {
        internalType: "enum Enum.Operation",
        name: "operation",
        type: "uint8",
      },
    ],
    name: "execTransactionFromModule",
    outputs: [
      {
        internalType: "bool",
        name: "success",
        type: "bool",
      },
    ],
    stateMutability: "nonpayable",
    type: "function",
  },
  {
    inputs: [
      {
        internalType: "address",
        name: "to",
        type: "address",
      },
      {
        internalType: "uint256",
        name: "value",
        type: "uint256",
      },
      {
        internalType: "bytes",
        name: "data",
        type: "bytes",
      },
      {
        internalType: "enum Enum.Operation",
        name: "operation",
        type: "uint8",
      },
    ],
    name: "execTransactionFromModuleReturnData",
    outputs: [
      {
        internalType: "bool",
        name: "success",
        type: "bool",
      },
      {
        internalType: "bytes",
        name: "returnData",
        type: "bytes",
      },
    ],
    stateMutability: "nonpayable",
    type: "function",
  },
  {
    inputs: [
      {
        internalType: "address",
        name: "start",
        type: "address",
      },
      {
        internalType: "uint256",
        name: "pageSize",
        type: "uint256",
      },
    ],
    name: "getModulesPaginated",
    outputs: [
      {
        internalType: "address[]",
        name: "array",
        type: "address[]",
      },
      {
        internalType: "address",
        name: "next",
        type: "address",
      },
    ],
    stateMutability: "view",
    type: "function",
  },
  {
    inputs: [
      {
        internalType: "address",
        name: "module",
        type: "address",
      },
    ],
    name: "isModuleEnabled",
    outputs: [
      {
        internalType: "bool",
        name: "",
        type: "bool",
      },
    ],
    stateMutability: "view",
    type: "function",
  },
] as const;

const _bytecode =
  "0x608060405234801561001057600080fd5b50610918806100206000396000f3fe608060405234801561001057600080fd5b50600436106100625760003560e01c80632d9ad53d14610067578063468721a71461008f5780635229073f146100a2578063610b5925146100c3578063cc2f8452146100d8578063e009cfde146100f9575b600080fd5b61007a61007536600461065a565b61010c565b60405190151581526020015b60405180910390f35b61007a61009d3660046106a1565b610147565b6100b56100b03660046106a1565b610223565b60405161008692919061077d565b6100d66100d136600461065a565b610259565b005b6100eb6100e63660046107d5565b610399565b6040516100869291906107ff565b6100d661010736600461085c565b610492565b600060016001600160a01b0383161480159061014157506001600160a01b038281166000908152602081905260409020541615155b92915050565b6000336001148015906101715750336000908152602081905260409020546001600160a01b031615155b6101aa5760405162461bcd60e51b815260206004820152600560248201526411d4cc4c0d60da1b60448201526064015b60405180910390fd5b6101b7858585855a6105be565b905080156101ef5760405133907f6895c13664aa4f67288b25d7a21d7aaa34916e355fb9b6fae0a139a9085becb890600090a261021b565b60405133907facd2c8702804128fdb0db2bb49f6d127dd0181c13fd45dbfe16de0930e2bd37590600090a25b949350505050565b6000606061023386868686610147565b915060405160203d0181016040523d81523d6000602083013e8091505094509492505050565b610261610605565b6001600160a01b0381161580159061028357506001600160a01b038116600114155b6102b75760405162461bcd60e51b8152602060048201526005602482015264475331303160d81b60448201526064016101a1565b6001600160a01b0381811660009081526020819052604090205416156103075760405162461bcd60e51b815260206004820152600560248201526423a998981960d91b60448201526064016101a1565b600060208181527fada5013122d395ba3c54772283fb069b10426056ef8ca54750cb9bb552a59e7d80546001600160a01b0385811680865260408087208054939094166001600160a01b03199384161790935560019095528254168417909155519182527fecdf3a3effea5783a3c4c2140e677577666428d44ed9d474a0b3a4c9943f8440910160405180910390a150565b606060008267ffffffffffffffff8111156103b6576103b661067c565b6040519080825280602002602001820160405280156103df578160200160208202803683370190505b506001600160a01b0380861660009081526020819052604081205492945091165b6001600160a01b0381161580159061042257506001600160a01b038116600114155b801561042d57508482105b1561048457808483815181106104455761044561088f565b6001600160a01b03928316602091820292909201810191909152918116600090815291829052604090912054168161047c816108a5565b925050610400565b908352919491935090915050565b61049a610605565b6001600160a01b038116158015906104bc57506001600160a01b038116600114155b6104f05760405162461bcd60e51b8152602060048201526005602482015264475331303160d81b60448201526064016101a1565b6001600160a01b038281166000908152602081905260409020548116908216146105445760405162461bcd60e51b8152602060048201526005602482015264475331303360d81b60448201526064016101a1565b6001600160a01b03818116600081815260208181526040808320805488871685528285208054919097166001600160a01b03199182161790965592849052825490941690915591519081527faab4fa2b463f581b2b32cb3b7e3b704b9ce37cc209b5fb4d77e593ace4054276910160405180910390a15050565b600060018360018111156105d4576105d46108cc565b036105ec576000808551602087018986f490506105fc565b600080855160208701888a87f190505b95945050505050565b33301461063c5760405162461bcd60e51b8152602060048201526005602482015264475330333160d81b60448201526064016101a1565b565b80356001600160a01b038116811461065557600080fd5b919050565b60006020828403121561066c57600080fd5b6106758261063e565b9392505050565b634e487b7160e01b600052604160045260246000fd5b80356002811061065557600080fd5b600080600080608085870312156106b757600080fd5b6106c08561063e565b935060208501359250604085013567ffffffffffffffff808211156106e457600080fd5b818701915087601f8301126106f857600080fd5b81358181111561070a5761070a61067c565b604051601f8201601f19908116603f011681019083821181831017156107325761073261067c565b816040528281528a602084870101111561074b57600080fd5b82602086016020830137600060208483010152809650505050505061077260608601610692565b905092959194509250565b821515815260006020604081840152835180604085015260005b818110156107b357858101830151858201606001528201610797565b506000606082860101526060601f19601f830116850101925050509392505050565b600080604083850312156107e857600080fd5b6107f18361063e565b946020939093013593505050565b604080825283519082018190526000906020906060840190828701845b828110156108415781516001600160a01b03168452928401929084019060010161081c565b5050506001600160a01b039490941692019190915250919050565b6000806040838503121561086f57600080fd5b6108788361063e565b91506108866020840161063e565b90509250929050565b634e487b7160e01b600052603260045260246000fd5b6000600182016108c557634e487b7160e01b600052601160045260246000fd5b5060010190565b634e487b7160e01b600052602160045260246000fdfea26469706673582212209940f9cbd4be0ce11847b0c1da978c76f6d65041d253cbb363bea00fc4e1ffdd64736f6c63430008120033";

type ModuleManagerConstructorParams =
  | [signer?: Signer]
  | ConstructorParameters<typeof ContractFactory>;

const isSuperArgs = (
  xs: ModuleManagerConstructorParams
): xs is ConstructorParameters<typeof ContractFactory> => xs.length > 1;

export class ModuleManager__factory extends ContractFactory {
  constructor(...args: ModuleManagerConstructorParams) {
    if (isSuperArgs(args)) {
      super(...args);
    } else {
      super(_abi, _bytecode, args[0]);
    }
  }

  override deploy(
    overrides?: Overrides & { from?: PromiseOrValue<string> }
  ): Promise<ModuleManager> {
    return super.deploy(overrides || {}) as Promise<ModuleManager>;
  }
  override getDeployTransaction(
    overrides?: Overrides & { from?: PromiseOrValue<string> }
  ): TransactionRequest {
    return super.getDeployTransaction(overrides || {});
  }
  override attach(address: string): ModuleManager {
    return super.attach(address) as ModuleManager;
  }
  override connect(signer: Signer): ModuleManager__factory {
    return super.connect(signer) as ModuleManager__factory;
  }

  static readonly bytecode = _bytecode;
  static readonly abi = _abi;
  static createInterface(): ModuleManagerInterface {
    return new utils.Interface(_abi) as ModuleManagerInterface;
  }
  static connect(
    address: string,
    signerOrProvider: Signer | Provider
  ): ModuleManager {
    return new Contract(address, _abi, signerOrProvider) as ModuleManager;
  }
}
