package com.poscoict.posledger.assets.chaincode.standard;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.poscoict.posledger.assets.SDK;
import com.poscoict.posledger.assets.util.ChaincodeCommunication;
import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.hyperledger.fabric.sdk.exception.CryptoException;
import org.hyperledger.fabric.sdk.exception.InvalidArgumentException;
import org.hyperledger.fabric.sdk.exception.ProposalException;
import org.hyperledger.fabric.sdk.exception.TransactionException;
import org.springframework.stereotype.Component;

import java.lang.reflect.InvocationTargetException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import static com.poscoict.posledger.assets.util.Function.*;

@Component
public class Default extends SDK {
    private static final Logger logger = LogManager.getLogger(Default.class);

    public Default() {
        super();
    }

    public Default(ObjectMapper objectMapper) {
        super(objectMapper);
    }

    public boolean mint(String tokenId) throws ProposalException, InvalidArgumentException, TransactionException {
        logger.info("---------------- mint SDK called ----------------");

        boolean result = false;
        try {
            String[] args = { tokenId };
            result = ChaincodeCommunication.sendTransaction(MINT_FUNCTION_NAME, args);
        } catch (ProposalException e) {
            logger.error(e);
            throw new ProposalException(e);
        } catch (InstantiationException e) {
            e.printStackTrace();
        } catch (InvocationTargetException e) {
            e.printStackTrace();
        } catch (NoSuchMethodException e) {
            e.printStackTrace();
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        } catch (CryptoException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        return result;
    }

    public boolean burn(String tokenId) throws ProposalException, InvalidArgumentException, TransactionException {
        logger.info("---------------- burn SDK called ----------------");

        boolean result;
        try {
            String[] args = { tokenId };
            result = ChaincodeCommunication.sendTransaction(BURN_FUNCTION_NAME, args);
        } catch (ProposalException | IllegalAccessException | InstantiationException | ClassNotFoundException | NoSuchMethodException | InvocationTargetException | CryptoException e) {
            logger.error(e);
            throw new ProposalException(e);
        }
        return result;
    }

    public String getType(String tokenId) throws ProposalException, InvalidArgumentException, TransactionException {
        logger.info("---------------- getType SDK called ----------------");

        String type;
        try {
            String[] args = { tokenId };
            type = ChaincodeCommunication.queryByChainCode(GET_TYPE_FUNCTION_NAME, args);
        } catch (ProposalException e) {
            logger.error(e);
            throw new ProposalException(e);
        }
        return type;
    }

    public List<String> tokenIdsOf(String owner) throws ProposalException, InvalidArgumentException, TransactionException {
        logger.info("---------------- tokenIdsOf SDK called ----------------");

        List<String> tokenIds = new ArrayList<String>();
        try {
            String[] args = { owner };
            String tokenIdsStr = ChaincodeCommunication.queryByChainCode(TOKEN_IDS_OF_FUNCTION_NAME, args);

            if(tokenIdsStr != null) {
                tokenIds = Arrays.asList(tokenIdsStr.substring(1, tokenIdsStr.length() - 1).split(", "));
            }
        } catch (ProposalException e) {
            logger.error(e);
            throw new ProposalException(e);
        }
        return tokenIds;
    }

    public String query(String tokenId) throws ProposalException, InvalidArgumentException, TransactionException {
        logger.info("---------------- query SDK called ----------------");

        String result;
        try {
            String[] args = { tokenId };
            result = ChaincodeCommunication.queryByChainCode(QUERY_FUNCTION_NAME, args);
        } catch (ProposalException e) {
            logger.error(e);
            throw new ProposalException(e);
        }
        return result;
    }
}
