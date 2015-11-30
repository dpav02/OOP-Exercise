//
//  Character.swift
//  OOP-Exercise
//
//  Created by David Pavel on 11/29/15.
//  Copyright © 2015 David Pavel. All rights reserved.
//

import Foundation

class Character {
    private var _name: String
    private var _attackPower: Int
    private var _hp: Int
    private var _type: String
    
    init(name: String, attackPower: Int, hp: Int, type: String) {
        self._name = name
        self._attackPower = attackPower
        self._hp = hp
        
        if type != "Orc" || type != "Solider" {
            // TODO: Make this random
            self._type = "Solider"
        } else {
            self._type = type
        }
    }
    
    func isAttacked(attackPower: Int) {
        self._hp -= attackPower
    }
    
    var hp: Int {
        get {
            return self._hp
        }
    }
    
    var name: String {
        get {
            return self._name
        }
    }
    
    var type: String {
        get {
            return self._type
        }
    }
    
    var attackPower: Int {
        get {
            return self._attackPower
        }
    }
    
    var isAlive: Bool {
        get {
            if self._hp <= 0 {
                return false
            }
            return true
        }
    }
}