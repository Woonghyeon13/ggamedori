package game.dori.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import game.dori.dao.SearchDAO;
import game.dori.service.SearchService;
import game.dori.util.ORDER_LIST_VO;
import game.dori.util.OTO_VO;
import game.dori.util.PRODOPT_VO;
import game.dori.util.PROD_Q_LIST_VO;
import game.dori.vo.MEMBER_VO;
import game.dori.vo.NOTICE_VO;
import game.dori.vo.PRODUCT_Q_VO;
import game.dori.vo.PRODUCT_VO;
import game.dori.vo.QA_VO;

@Service
public class SearchServiceImpl implements SearchService {

    @Autowired
    private SearchDAO searchDAO;

    @Override
    public List<MEMBER_VO> mSearch(String searchText, String searchOption, int start, int limit) {
        return searchDAO.mSearch(searchText, searchOption, start, limit);
    }

    @Override
    public int mCountSearchResults(String searchText, String searchOption) {
        return searchDAO.mCountSearchResults(searchText, searchOption);
    }

    @Override
    public List<OTO_VO> oto_search(String searchText, String searchOption, int start, int limit) {
        return searchDAO.oto_search(searchText, searchOption, start, limit);
    }

    @Override
    public int oto_countSearchResults(String searchText, String searchOption) {
        return searchDAO.oto_countSearchResults(searchText, searchOption);
    }

    @Override
    public List<NOTICE_VO> notice_search(String searchText, String searchOption, int start, int limit) {
        return searchDAO.notice_search(searchText, searchOption, start, limit);
    }

    @Override
    public int notice_countSearchResults(String searchText, String searchOption) {
        return searchDAO.notice_countSearchResults(searchText, searchOption);
    }

	@Override
	public List<PRODUCT_Q_VO> qaprod_search(String searchText, String searchOption, int start, int limit) {
		  return searchDAO.qrod_search(searchText, searchOption, start, limit);
	}

	@Override
	public int qaprod_countSearchResults(String searchText, String searchOption) {
		 return searchDAO.qrod_countSearchResults(searchText, searchOption);
	}

	@Override
	public List<PRODUCT_VO> prod_search(String searchText, String searchOption, int start, int limit) {
		// TODO Auto-generated method stub
		 return searchDAO.prod_search(searchText, searchOption, start, limit);
	}

	@Override
	public int prod_countSearchResults(String searchText, String searchOption) {
		// TODO Auto-generated method stub
		 return searchDAO.prod_countSearchResults(searchText, searchOption);
	}

	@Override
	public List<ORDER_LIST_VO> orderlist_search(String searchText, String searchOption, int start, int limit) {
		// TODO Auto-generated method stub
		return searchDAO.orderlist_search(searchText, searchOption, start, limit);
	}

	

	@Override
	public int orderlist_countSearchResults(String searchText, String searchOption) {
		// TODO Auto-generated method stub
		return searchDAO.oto_countSearchResults(searchText, searchOption);
	}

	/*-----------------*/
	
	@Override
	public List<PRODUCT_Q_VO> prodq_search(String searchText, String searchOption, int start, int limit) {
		// TODO Auto-generated method stub
		return searchDAO.prodq_search(searchText, searchOption, start, limit);
	}

	@Override
	public int prodq_countSearchResults(String searchText, String searchOption) {
		// TODO Auto-generated method stub
		return searchDAO.prodq_countSearchResults(searchText, searchOption);
	}

}