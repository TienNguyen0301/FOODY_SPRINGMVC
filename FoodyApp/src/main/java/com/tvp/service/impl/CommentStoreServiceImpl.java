  /*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.tvp.service.impl;

import com.tvp.pojo.FollowRating;
import com.tvp.pojo.Store;
import com.tvp.pojo.User;
import com.tvp.repository.CommentStoreRepository;
import com.tvp.repository.StoreRepository;
import com.tvp.repository.UserRepository;
import com.tvp.service.CommentStoreService;
import java.util.Date;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author tran van phuong
 */
@Service
public class CommentStoreServiceImpl implements CommentStoreService{
    
    @Autowired
    private CommentStoreRepository commentStoreRepository;
    
    @Autowired
    private UserRepository userRepository;
    
    
    @Autowired
    private StoreRepository storeRepository;

    @Override
    public List<FollowRating> getCommentsByStoreId(int storeId, int page) {
        return this.commentStoreRepository.getCommentsByStoreId(storeId, page);
    }

    @Override
    public long CountComment(int storeId) {
        return this.commentStoreRepository.CountComment(storeId);
    }

    @Override
    public FollowRating addComment(String content, int storeId, int value, User creator) {
        Store s = this.storeRepository.getStoreById(storeId);
//        User u = this.userRepository.getUserById(5);
        
        FollowRating c = new FollowRating();

        System.out.println("++++++++++++++++++++++++++++++++/");
        System.out.println(value);
         System.out.println("----------------------------");
//         if(value == 1){
//             c.setValue(1);
//         } else if(value == 2){
//              c.setValue(2);
//         }
//         else if(value == 3){
//              c.setValue(3);
//         }
//         else if(value == 4){
//              c.setValue(4);
//         } else if(value == 5) {
//              c.setValue(5);
//         }
        c.setValue(value);
        c.setContent(content);
        c.setStoreId(s);
        c.setUserId(creator);
        c.setCreatedDate(new Date());
        
        return this.commentStoreRepository.addComment(c);
        
    }

    @Override
    public FollowRating getRatingById(int i) {
         return this.commentStoreRepository.getRatingById(i);
    }
    
}
