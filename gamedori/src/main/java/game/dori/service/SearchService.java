package game.dori.service;

import java.util.List;

import game.dori.util.ORDER_LIST_VO;
import game.dori.util.OTO_VO;
import game.dori.util.PRODOPT_VO;
import game.dori.util.PROD_Q_LIST_VO;
import game.dori.vo.MEMBER_VO;
import game.dori.vo.NOTICE_VO;
import game.dori.vo.PRODUCT_VO;
import game.dori.vo.QA_VO;

public interface SearchService {

    List<MEMBER_VO> mSearch(String searchText, String searchOption, int start, int limit);

    int mCountSearchResults(String searchText, String searchOption);

    List<OTO_VO> oto_search(String searchText, String searchOption, int start, int limit);

    int oto_countSearchResults(String searchText, String searchOption);

    List<NOTICE_VO> notice_search(String searchText, String searchOption, int start, int limit);

    int notice_countSearchResults(String searchText, String searchOption);
    
    List<PROD_Q_LIST_VO> qaprod_search(String searchText, String searchOption, int start, int limit);

    int qaprod_countSearchResults(String searchText, String searchOption);

    List<PRODUCT_VO> prod_search(String searchText, String searchOption, int start, int limit);

    int prod_countSearchResults(String searchText, String searchOption);
   
    List<ORDER_LIST_VO> orderlist_search(String searchText, String searchOption, int start, int limit);

    int orderlist_countSearchResults(String searchText, String searchOption);
   
  
}